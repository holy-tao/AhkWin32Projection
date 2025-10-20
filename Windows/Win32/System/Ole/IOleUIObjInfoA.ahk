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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwObject 
     * @param {Pointer<UInt32>} lpdwObjSize 
     * @param {Pointer<PSTR>} lplpszLabel 
     * @param {Pointer<PSTR>} lplpszType 
     * @param {Pointer<PSTR>} lplpszShortType 
     * @param {Pointer<PSTR>} lplpszLocation 
     * @returns {HRESULT} 
     */
    GetObjectInfo(dwObject, lpdwObjSize, lplpszLabel, lplpszType, lplpszShortType, lplpszLocation) {
        result := ComCall(3, this, "uint", dwObject, "uint*", lpdwObjSize, "ptr", lplpszLabel, "ptr", lplpszType, "ptr", lplpszShortType, "ptr", lplpszLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwObject 
     * @param {Pointer<Guid>} lpClassID 
     * @param {Pointer<UInt16>} lpwFormat 
     * @param {Pointer<Guid>} lpConvertDefaultClassID 
     * @param {Pointer<Guid>} lplpClsidExclude 
     * @param {Pointer<UInt32>} lpcClsidExclude 
     * @returns {HRESULT} 
     */
    GetConvertInfo(dwObject, lpClassID, lpwFormat, lpConvertDefaultClassID, lplpClsidExclude, lpcClsidExclude) {
        result := ComCall(4, this, "uint", dwObject, "ptr", lpClassID, "ushort*", lpwFormat, "ptr", lpConvertDefaultClassID, "ptr", lplpClsidExclude, "uint*", lpcClsidExclude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwObject 
     * @param {Pointer<Guid>} clsidNew 
     * @returns {HRESULT} 
     */
    ConvertObject(dwObject, clsidNew) {
        result := ComCall(5, this, "uint", dwObject, "ptr", clsidNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwObject 
     * @param {Pointer<HGLOBAL>} phMetaPict 
     * @param {Pointer<UInt32>} pdvAspect 
     * @param {Pointer<Int32>} pnCurrentScale 
     * @returns {HRESULT} 
     */
    GetViewInfo(dwObject, phMetaPict, pdvAspect, pnCurrentScale) {
        result := ComCall(6, this, "uint", dwObject, "ptr", phMetaPict, "uint*", pdvAspect, "int*", pnCurrentScale, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    SetViewInfo(dwObject, hMetaPict, dvAspect, nCurrentScale, bRelativeToOrig) {
        hMetaPict := hMetaPict is Win32Handle ? NumGet(hMetaPict, "ptr") : hMetaPict

        result := ComCall(7, this, "uint", dwObject, "ptr", hMetaPict, "uint", dvAspect, "int", nCurrentScale, "int", bRelativeToOrig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
