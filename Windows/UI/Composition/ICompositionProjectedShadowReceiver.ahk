#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Visual.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionProjectedShadowReceiver extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionProjectedShadowReceiver
     * @type {Guid}
     */
    static IID => Guid("{1377985a-6a49-536a-9be4-a96a8e5298a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReceivingVisual", "put_ReceivingVisual"]

    /**
     * @type {Visual} 
     */
    ReceivingVisual {
        get => this.get_ReceivingVisual()
        set => this.put_ReceivingVisual(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_ReceivingVisual() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(value)
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_ReceivingVisual(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
