#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayTask2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayTask2
     * @type {Guid}
     */
    static IID => Guid("{0957ea19-bd55-55de-9267-c97b61e71c37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSignal"]

    /**
     * 
     * @param {Integer} signalKind 
     * @param {DisplayFence} fence 
     * @returns {HRESULT} 
     */
    SetSignal(signalKind, fence) {
        result := ComCall(6, this, "int", signalKind, "ptr", fence, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
