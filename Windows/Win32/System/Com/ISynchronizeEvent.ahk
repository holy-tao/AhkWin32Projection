#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISynchronizeHandle.ahk

/**
 * Assigns an event handle to a synchronization object.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronizeevent
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeEvent extends ISynchronizeHandle{
    /**
     * The interface identifier for ISynchronizeEvent
     * @type {Guid}
     */
    static IID => Guid("{00000032-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<HANDLE>} ph 
     * @returns {HRESULT} 
     */
    SetEventHandle(ph) {
        result := ComCall(4, this, "ptr", ph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
