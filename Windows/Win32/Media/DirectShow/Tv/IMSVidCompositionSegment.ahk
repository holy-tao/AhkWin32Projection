#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidGraphSegment.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidCompositionSegment extends IMSVidGraphSegment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidCompositionSegment
     * @type {Guid}
     */
    static IID => Guid("{1c15d483-911d-11d2-b632-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compose", "get_Up", "get_Down"]

    /**
     * 
     * @param {IMSVidGraphSegment} upstream 
     * @param {IMSVidGraphSegment} downstream 
     * @returns {HRESULT} 
     */
    Compose(upstream, downstream) {
        result := ComCall(19, this, "ptr", upstream, "ptr", downstream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidGraphSegment>} upstream 
     * @returns {HRESULT} 
     */
    get_Up(upstream) {
        result := ComCall(20, this, "ptr*", upstream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidGraphSegment>} downstream 
     * @returns {HRESULT} 
     */
    get_Down(downstream) {
        result := ComCall(21, this, "ptr*", downstream, "HRESULT")
        return result
    }
}
