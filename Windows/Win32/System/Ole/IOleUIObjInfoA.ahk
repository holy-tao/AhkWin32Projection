#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implemented by containers and used by the container's Object Properties dialog box and by the Convert dialog box.
 * @remarks
 * 
  * > [!NOTE]
  * > The oledlg.h header defines IOleUIObjInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/nn-oledlg-ioleuiobjinfoa
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset ANSI
 */
class IOleUIObjInfoA extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectInfo", "GetConvertInfo", "ConvertObject", "GetViewInfo", "SetViewInfo"]

    /**
     * 
     * @param {Integer} dwObject 
     * @param {Pointer<Integer>} lpdwObjSize 
     * @param {Pointer<PSTR>} lplpszLabel 
     * @param {Pointer<PSTR>} lplpszType 
     * @param {Pointer<PSTR>} lplpszShortType 
     * @param {Pointer<PSTR>} lplpszLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuiobjinfoa-getobjectinfo
     */
    GetObjectInfo(dwObject, lpdwObjSize, lplpszLabel, lplpszType, lplpszShortType, lplpszLocation) {
        lpdwObjSizeMarshal := lpdwObjSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwObject, lpdwObjSizeMarshal, lpdwObjSize, "ptr", lplpszLabel, "ptr", lplpszType, "ptr", lplpszShortType, "ptr", lplpszLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwObject 
     * @param {Pointer<Guid>} lpClassID 
     * @param {Pointer<Integer>} lpwFormat 
     * @param {Pointer<Guid>} lpConvertDefaultClassID 
     * @param {Pointer<Pointer<Guid>>} lplpClsidExclude 
     * @param {Pointer<Integer>} lpcClsidExclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuiobjinfoa-getconvertinfo
     */
    GetConvertInfo(dwObject, lpClassID, lpwFormat, lpConvertDefaultClassID, lplpClsidExclude, lpcClsidExclude) {
        lpwFormatMarshal := lpwFormat is VarRef ? "ushort*" : "ptr"
        lpcClsidExcludeMarshal := lpcClsidExclude is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwObject, "ptr", lpClassID, lpwFormatMarshal, lpwFormat, "ptr", lpConvertDefaultClassID, "ptr*", lplpClsidExclude, lpcClsidExcludeMarshal, lpcClsidExclude, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwObject 
     * @param {Pointer<Guid>} clsidNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuiobjinfoa-convertobject
     */
    ConvertObject(dwObject, clsidNew) {
        result := ComCall(5, this, "uint", dwObject, "ptr", clsidNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwObject 
     * @param {Pointer<HGLOBAL>} phMetaPict 
     * @param {Pointer<Integer>} pdvAspect 
     * @param {Pointer<Integer>} pnCurrentScale 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuiobjinfoa-getviewinfo
     */
    GetViewInfo(dwObject, phMetaPict, pdvAspect, pnCurrentScale) {
        pdvAspectMarshal := pdvAspect is VarRef ? "uint*" : "ptr"
        pnCurrentScaleMarshal := pnCurrentScale is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "uint", dwObject, "ptr", phMetaPict, pdvAspectMarshal, pdvAspect, pnCurrentScaleMarshal, pnCurrentScale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwObject 
     * @param {HGLOBAL} hMetaPict 
     * @param {Integer} dvAspect 
     * @param {Integer} nCurrentScale 
     * @param {BOOL} bRelativeToOrig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuiobjinfoa-setviewinfo
     */
    SetViewInfo(dwObject, hMetaPict, dvAspect, nCurrentScale, bRelativeToOrig) {
        hMetaPict := hMetaPict is Win32Handle ? NumGet(hMetaPict, "ptr") : hMetaPict

        result := ComCall(7, this, "uint", dwObject, "ptr", hMetaPict, "uint", dvAspect, "int", nCurrentScale, "int", bRelativeToOrig, "HRESULT")
        return result
    }
}
