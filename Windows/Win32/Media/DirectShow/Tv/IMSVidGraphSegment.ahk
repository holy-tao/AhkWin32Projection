#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<IUnknown>} pInit 
     * @returns {HRESULT} 
     */
    get_Init(pInit) {
        result := ComCall(4, this, "ptr*", pInit, "HRESULT")
        return result
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
     * @param {Pointer<IEnumFilters>} pNewEnum 
     * @returns {HRESULT} 
     */
    EnumFilters(pNewEnum) {
        result := ComCall(6, this, "ptr*", pNewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidGraphSegmentContainer>} ppCtl 
     * @returns {HRESULT} 
     */
    get_Container(ppCtl) {
        result := ComCall(7, this, "ptr*", ppCtl, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        result := ComCall(9, this, "int*", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    get_Category(pGuid) {
        result := ComCall(10, this, "ptr", pGuid, "HRESULT")
        return result
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
