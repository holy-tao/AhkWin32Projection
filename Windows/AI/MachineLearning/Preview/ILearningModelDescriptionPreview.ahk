#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include .\ILearningModelVariableDescriptorPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class ILearningModelDescriptionPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelDescriptionPreview
     * @type {Guid}
     */
    static IID => Guid("{f52c09c6-8611-40ad-8e59-de3fd7030a40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Author", "get_Name", "get_Domain", "get_Description", "get_Version", "get_Metadata", "get_InputFeatures", "get_OutputFeatures"]

    /**
     * @type {HSTRING} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Metadata {
        get => this.get_Metadata()
    }

    /**
     * @type {IIterable<ILearningModelVariableDescriptorPreview>} 
     */
    InputFeatures {
        get => this.get_InputFeatures()
    }

    /**
     * @type {IIterable<ILearningModelVariableDescriptorPreview>} 
     */
    OutputFeatures {
        get => this.get_OutputFeatures()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Author() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Domain() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        result := ComCall(10, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Metadata() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IIterable<ILearningModelVariableDescriptorPreview>} 
     */
    get_InputFeatures() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(ILearningModelVariableDescriptorPreview, value)
    }

    /**
     * 
     * @returns {IIterable<ILearningModelVariableDescriptorPreview>} 
     */
    get_OutputFeatures() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(ILearningModelVariableDescriptorPreview, value)
    }
}
