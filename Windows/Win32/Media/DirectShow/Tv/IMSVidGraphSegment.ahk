#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\IEnumFilters.ahk
#Include .\IMSVidGraphSegmentContainer.ahk
#Include ..\..\..\System\Com\IPersist.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidGraphSegment extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidGraphSegment
     * @type {Guid}
     */
    static IID => Guid("{238dec54-adeb-4005-a349-f772b9afebc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Init", "put_Init", "EnumFilters", "get_Container", "put_Container", "get_Type", "get_Category", "Build", "PostBuild", "PreRun", "PostRun", "PreStop", "PostStop", "OnEventNotify", "Decompose"]

    /**
     * 
     * @returns {IUnknown} 
     */
    get_Init() {
        result := ComCall(4, this, "ptr*", &pInit := 0, "HRESULT")
        return IUnknown(pInit)
    }

    /**
     * 
     * @param {IUnknown} pInit 
     * @returns {HRESULT} 
     */
    put_Init(pInit) {
        result := ComCall(5, this, "ptr", pInit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumFilters} 
     */
    EnumFilters() {
        result := ComCall(6, this, "ptr*", &pNewEnum := 0, "HRESULT")
        return IEnumFilters(pNewEnum)
    }

    /**
     * 
     * @returns {IMSVidGraphSegmentContainer} 
     */
    get_Container() {
        result := ComCall(7, this, "ptr*", &ppCtl := 0, "HRESULT")
        return IMSVidGraphSegmentContainer(ppCtl)
    }

    /**
     * 
     * @param {IMSVidGraphSegmentContainer} pCtl 
     * @returns {HRESULT} 
     */
    put_Container(pCtl) {
        result := ComCall(8, this, "ptr", pCtl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(9, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Category() {
        pGuid := Guid()
        result := ComCall(10, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Build() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostBuild() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PreRun() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostRun() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PreStop() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostStop() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lEventCode 
     * @param {Pointer} lEventParm1 
     * @param {Pointer} lEventParm2 
     * @returns {HRESULT} 
     */
    OnEventNotify(lEventCode, lEventParm1, lEventParm2) {
        result := ComCall(17, this, "int", lEventCode, "ptr", lEventParm1, "ptr", lEventParm2, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Decompose() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
