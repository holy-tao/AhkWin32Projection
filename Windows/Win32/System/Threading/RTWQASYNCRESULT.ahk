#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRtwqAsyncResult.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class RTWQASYNCRESULT extends IRtwqAsyncResult{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8
}
