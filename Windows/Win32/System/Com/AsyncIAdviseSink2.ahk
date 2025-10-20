#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AsyncIAdviseSink.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class AsyncIAdviseSink2 extends AsyncIAdviseSink{
    /**
     * The interface identifier for AsyncIAdviseSink2
     * @type {Guid}
     */
    static IID => Guid("{00000151-0000-0000-c000-000000000046}")

    /**
     * The class identifier for AsyncIAdviseSink2
     * @type {Guid}
     */
    static CLSID => Guid("{00000151-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<IMoniker>} pmk 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnLinkSrcChange(pmk) {
        ComCall(13, this, "ptr", pmk)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnLinkSrcChange() {
        ComCall(14, this)
        return result
    }
}
