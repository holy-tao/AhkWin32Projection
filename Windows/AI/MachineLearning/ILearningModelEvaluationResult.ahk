#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelEvaluationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelEvaluationResult
     * @type {Guid}
     */
    static IID => Guid("{b2f9bfcd-960e-49c0-8593-eb190ae3eee2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CorrelationId", "get_ErrorStatus", "get_Succeeded", "get_Outputs"]

    /**
     * @type {HSTRING} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
    }

    /**
     * @type {Integer} 
     */
    ErrorStatus {
        get => this.get_ErrorStatus()
    }

    /**
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Outputs {
        get => this.get_Outputs()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CorrelationId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Outputs() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, value)
    }
}
