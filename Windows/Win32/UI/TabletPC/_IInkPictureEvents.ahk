#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class _IInkPictureEvents extends IDispatch{
    /**
     * The interface identifier for _IInkPictureEvents
     * @type {Guid}
     */
    static IID => Guid("{60ff4fee-22ff-4484-acc1-d308d9cd7ea3}")

    /**
     * The class identifier for _IInkPictureEvents
     * @type {Guid}
     */
    static CLSID => Guid("{60ff4fee-22ff-4484-acc1-d308d9cd7ea3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7
}
