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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnViewStatusChange"]

    /**
     * Notifies the sink that a view status of an object has changed.
     * @param {Integer} dwViewStatus The new view status. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-viewstatus">VIEWSTATUS</a> enumeration.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iadvisesinkex-onviewstatuschange
     */
    OnViewStatusChange(dwViewStatus) {
        ComCall(8, this, "uint", dwViewStatus)
    }
}
