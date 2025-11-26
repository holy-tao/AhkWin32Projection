#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\IViewObject.ahk

/**
 * An extension to the IViewObject interface which returns the size of the drawing for a given view of an object. You can prevent the object from being run if it isn't already running by calling this method instead of IOleObject::GetExtent.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iviewobject2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IViewObject2 extends IViewObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObject2
     * @type {Guid}
     */
    static IID => Guid("{00000127-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtent"]

    /**
     * Retrieves the size that the specified view object will be drawn on the specified target device.
     * @param {Integer} dwDrawAspect Requested view of the object whose size is of interest. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-dvaspect2">DVASPECT2</a> enumerations. Note that newer objects and containers that support optimized drawing interfaces support the <b>DVASPECT2</b> enumeration values. Older objects and containers that do not support optimized drawing interfaces may not support <b>DVASPECT2</b>.
     * @param {Integer} lindex The portion of the object that is of interest. Currently, the only possible value is -1.
     * @param {Pointer<DVTARGETDEVICE>} ptd A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure defining the target device for which the object's size should be returned.
     * @returns {SIZE} A pointer to where the object's size is returned.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iviewobject2-getextent
     */
    GetExtent(dwDrawAspect, lindex, ptd) {
        lpsizel := SIZE()
        result := ComCall(9, this, "uint", dwDrawAspect, "int", lindex, "ptr", ptd, "ptr", lpsizel, "HRESULT")
        return lpsizel
    }
}
