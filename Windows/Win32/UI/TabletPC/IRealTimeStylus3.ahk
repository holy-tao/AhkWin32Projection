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
     * 
     * @param {Pointer<BOOL>} pfEnable 
     * @returns {HRESULT} 
     */
    get_MultiTouchEnabled(pfEnable) {
        result := ComCall(3, this, "ptr", pfEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    put_MultiTouchEnabled(fEnable) {
        result := ComCall(4, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
