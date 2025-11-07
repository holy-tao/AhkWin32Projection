#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VMR9DeinterlaceCaps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRDeinterlaceControl9 interface supports hardware-accelerated deinterlacing using the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
  * Deinterlacing modes are identified by GUIDs. The graphics device driver returns an array of GUIDs for the modes that it supports. The array is sorted in order of quality, from best quality to lowest quality. To retrieve the list of GUIDs, call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes">GetNumberOfDeinterlaceModes</a> method. To obtain more information about a particular mode, pass this GUID to the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps">GetDeinterlaceModeCaps</a> method. To configure the VMR to use a particular mode, call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlacemode">SetDeinterlaceMode</a> method.
  * 
  * To determine what de-interlacing modes are available, perform these steps:
  * 
  * <ol>
  * <li>Create the VMR-9 and put it into mixing mode.
  *       </li>
  * <li>Query the VMR-9 for the <b>IVMRDeinterlaceControl9</b> interface</li>
  * <li>Fill in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ns-strmif-vmrvideodesc">VMRVideoDesc</a> structure that describes the format of the interlaced video.</li>
  * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes">IVMRDeinterlaceControl9::GetNumberOfDeinterlaceModes</a> to get the number of available de-interlacing modes.</li>
  * <li>For each mode returned, call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps">IVMRDeinterlaceControl::GetDeinterlaceModeCaps</a> to get information about the mode.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrdeinterlacecontrol9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRDeinterlaceControl9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRDeinterlaceControl9
     * @type {Guid}
     */
    static IID => Guid("{a215fb8d-13c2-4f7f-993c-003d6271a459}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberOfDeinterlaceModes", "GetDeinterlaceModeCaps", "GetDeinterlaceMode", "SetDeinterlaceMode", "GetDeinterlacePrefs", "SetDeinterlacePrefs", "GetActualDeinterlaceMode"]

    /**
     * 
     * @param {Pointer<VMR9VideoDesc>} lpVideoDescription 
     * @param {Pointer<Integer>} lpdwNumDeinterlaceModes 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getnumberofdeinterlacemodes
     */
    GetNumberOfDeinterlaceModes(lpVideoDescription, lpdwNumDeinterlaceModes) {
        lpdwNumDeinterlaceModesMarshal := lpdwNumDeinterlaceModes is VarRef ? "uint*" : "ptr"

        lpDeinterlaceModes := Guid()
        result := ComCall(3, this, "ptr", lpVideoDescription, lpdwNumDeinterlaceModesMarshal, lpdwNumDeinterlaceModes, "ptr", lpDeinterlaceModes, "HRESULT")
        return lpDeinterlaceModes
    }

    /**
     * 
     * @param {Pointer<Guid>} lpDeinterlaceMode 
     * @param {Pointer<VMR9VideoDesc>} lpVideoDescription 
     * @returns {VMR9DeinterlaceCaps} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemodecaps
     */
    GetDeinterlaceModeCaps(lpDeinterlaceMode, lpVideoDescription) {
        lpDeinterlaceCaps := VMR9DeinterlaceCaps()
        result := ComCall(4, this, "ptr", lpDeinterlaceMode, "ptr", lpVideoDescription, "ptr", lpDeinterlaceCaps, "HRESULT")
        return lpDeinterlaceCaps
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlacemode
     */
    GetDeinterlaceMode(dwStreamID) {
        lpDeinterlaceMode := Guid()
        result := ComCall(5, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "HRESULT")
        return lpDeinterlaceMode
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Guid>} lpDeinterlaceMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlacemode
     */
    SetDeinterlaceMode(dwStreamID, lpDeinterlaceMode) {
        result := ComCall(6, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getdeinterlaceprefs
     */
    GetDeinterlacePrefs() {
        result := ComCall(7, this, "uint*", &lpdwDeinterlacePrefs := 0, "HRESULT")
        return lpdwDeinterlacePrefs
    }

    /**
     * 
     * @param {Integer} dwDeinterlacePrefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-setdeinterlaceprefs
     */
    SetDeinterlacePrefs(dwDeinterlacePrefs) {
        result := ComCall(8, this, "uint", dwDeinterlacePrefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrdeinterlacecontrol9-getactualdeinterlacemode
     */
    GetActualDeinterlaceMode(dwStreamID) {
        lpDeinterlaceMode := Guid()
        result := ComCall(9, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "HRESULT")
        return lpDeinterlaceMode
    }
}
