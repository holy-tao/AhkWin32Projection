#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IRealTimeStylus3 interface enables multitouch for the realtime stylus.
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-irealtimestylus3
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IRealTimeStylus3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRealTimeStylus3
     * @type {Guid}
     */
    static IID => Guid("{d70230a3-6986-4051-b57a-1cf69f4d9db5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MultiTouchEnabled", "put_MultiTouchEnabled"]

    /**
     * 
     * @param {Pointer<BOOL>} pfEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus3-get_multitouchenabled
     */
    get_MultiTouchEnabled(pfEnable) {
        result := ComCall(3, this, "ptr", pfEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus3-put_multitouchenabled
     */
    put_MultiTouchEnabled(fEnable) {
        result := ComCall(4, this, "int", fEnable, "HRESULT")
        return result
    }
}
