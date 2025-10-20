#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IAdviseSink.ahk

/**
 * This interface is derived from IAdviseSink to provide extensions for notifying the sink of changes in an object's view status.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iadvisesinkex
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IAdviseSinkEx extends IAdviseSink{
    /**
     * The interface identifier for IAdviseSinkEx
     * @type {Guid}
     */
    static IID => Guid("{3af24290-0c96-11ce-a0cf-00aa00600ab8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Integer} dwViewStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    OnViewStatusChange(dwViewStatus) {
        ComCall(8, this, "uint", dwViewStatus)
        return result
    }
}
