require File::expand_path("../../../spec_helper", __FILE__)
module Insight
  describe "ActiveResourcePanel" do
    before do
      mock_constant("ActiveResource::Connection")
      reset_insight :panel_files => %w{active_resource_panel}
    end

    def mock_model(name)
      model = stub("model")
      model.stub!(:name => name)
      obj = stub(name)
      obj.stub!(:base_class => model)
      obj
    end

    describe "heading" do
      it "displays the total number of instantiated AR objects" do
        app.before_return do
          mock_method_call("ActiveResource::Connection", "request", [], :instance, "")
          mock_method_call("ActiveResource::Connection", "request", [], :instance, "")
        end

        response = get_via_rack "/"
        response.should have_heading("ARes: 2 Queries")
      end
    end

    describe "content", :pending => true do
      it "displays the count of instantiated objects for each class" do
        app.before_return do
          mock_method_call("ActiveResource::Connection", "request", [], :instance, "")
          mock_method_call("ActiveResource::Connection", "request", [], :instance, "")
        end
        response = get_via_rack "/"
      end
    end
  end
end
