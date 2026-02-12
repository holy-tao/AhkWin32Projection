#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class ILearningModelEvaluationResultPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelEvaluationResultPreview
     * @type {Guid}
     */
    static IID => Guid("{df25ea9f-9863-4088-8498-87a1f4686f92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CorrelationId", "get_Outputs"]

    /**
     * @type {HSTRING} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
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
        correlationId_ := HSTRING()
        result := ComCall(6, this, "ptr", correlationId_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return correlationId_
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Outputs() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, value)
    }
}
