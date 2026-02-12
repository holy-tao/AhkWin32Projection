#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Input
 * @version WindowsRuntime 1.4
 */
class IRemoteTextConnection2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteTextConnection2
     * @type {Guid}
     */
    static IID => Guid("{05f99345-84c8-56c5-934f-73ea00f8c2d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportPredictedKeyEvent"]

    /**
     * 
     * @param {Integer} scanCode 
     * @param {Integer} attributes 
     * @returns {HRESULT} 
     */
    ReportPredictedKeyEvent(scanCode, attributes) {
        result := ComCall(6, this, "ushort", scanCode, "uint", attributes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
