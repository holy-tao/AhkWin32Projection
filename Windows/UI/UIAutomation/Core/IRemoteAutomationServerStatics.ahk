#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class IRemoteAutomationServerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteAutomationServerStatics
     * @type {Guid}
     */
    static IID => Guid("{e6e8945e-0c11-5028-9ae3-c2771288b6b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportSession"]

    /**
     * 
     * @param {Guid} sessionId 
     * @returns {HRESULT} 
     */
    ReportSession(sessionId) {
        result := ComCall(6, this, "ptr", sessionId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
