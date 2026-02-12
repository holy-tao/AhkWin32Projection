#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ILearningModelFeatureDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Describes the common properties that all features have.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.ilearningmodelfeaturedescriptor
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModel
     * @type {Guid}
     */
    static IID => Guid("{5b8e4920-489f-4e86-9128-265a327b78fa}")

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
     * @type {IVectorView<ILearningModelFeatureDescriptor>} 
     */
    InputFeatures {
        get => this.get_InputFeatures()
    }

    /**
     * @type {IVectorView<ILearningModelFeatureDescriptor>} 
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
     * @returns {IVectorView<ILearningModelFeatureDescriptor>} 
     */
    get_InputFeatures() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ILearningModelFeatureDescriptor, value)
    }

    /**
     * 
     * @returns {IVectorView<ILearningModelFeatureDescriptor>} 
     */
    get_OutputFeatures() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ILearningModelFeatureDescriptor, value)
    }
}
