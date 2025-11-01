#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Integer} lindex 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {Pointer<SIZE>} lpsizel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject2-getextent
     */
    GetExtent(dwDrawAspect, lindex, ptd, lpsizel) {
        result := ComCall(9, this, "uint", dwDrawAspect, "int", lindex, "ptr", ptd, "ptr", lpsizel, "HRESULT")
        return result
    }
}
