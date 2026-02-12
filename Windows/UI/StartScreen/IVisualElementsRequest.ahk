#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SecondaryTileVisualElements.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\VisualElementsRequestDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class IVisualElementsRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualElementsRequest
     * @type {Guid}
     */
    static IID => Guid("{c138333a-9308-4072-88cc-d068db347c68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VisualElements", "get_AlternateVisualElements", "get_Deadline", "GetDeferral"]

    /**
     * @type {SecondaryTileVisualElements} 
     */
    VisualElements {
        get => this.get_VisualElements()
    }

    /**
     * @type {IVectorView<SecondaryTileVisualElements>} 
     */
    AlternateVisualElements {
        get => this.get_AlternateVisualElements()
    }

    /**
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * 
     * @returns {SecondaryTileVisualElements} 
     */
    get_VisualElements() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SecondaryTileVisualElements(value)
    }

    /**
     * 
     * @returns {IVectorView<SecondaryTileVisualElements>} 
     */
    get_AlternateVisualElements() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SecondaryTileVisualElements, value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {VisualElementsRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(9, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualElementsRequestDeferral(deferral_)
    }
}
