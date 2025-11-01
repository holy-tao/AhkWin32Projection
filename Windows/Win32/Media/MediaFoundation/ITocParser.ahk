#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITocParser interface represents a TOC Parser object. It provides methods for storing tables of contents in a video file and retrieving tables of contents from a video file.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-itocparser
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ITocParser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITocParser
     * @type {Guid}
     */
    static IID => Guid("{ecfb9a55-9298-4f49-887f-0b36206599d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GetTocCount", "GetTocByIndex", "GetTocByType", "AddToc", "RemoveTocByIndex", "RemoveTocByType", "Commit"]

    /**
     * 
     * @param {PWSTR} pwszFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocparser-init
     */
    Init(pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "ptr", pwszFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Pointer<Integer>} pdwTocCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocparser-gettoccount
     */
    GetTocCount(enumTocPosType, pdwTocCount) {
        pdwTocCountMarshal := pdwTocCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", enumTocPosType, pdwTocCountMarshal, pdwTocCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Integer} dwTocIndex 
     * @param {Pointer<IToc>} ppToc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocparser-gettocbyindex
     */
    GetTocByIndex(enumTocPosType, dwTocIndex, ppToc) {
        result := ComCall(5, this, "int", enumTocPosType, "uint", dwTocIndex, "ptr*", ppToc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Guid} guidTocType 
     * @param {Pointer<ITocCollection>} ppTocs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocparser-gettocbytype
     */
    GetTocByType(enumTocPosType, guidTocType, ppTocs) {
        result := ComCall(6, this, "int", enumTocPosType, "ptr", guidTocType, "ptr*", ppTocs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {IToc} pToc 
     * @param {Pointer<Integer>} pdwTocIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocparser-addtoc
     */
    AddToc(enumTocPosType, pToc, pdwTocIndex) {
        pdwTocIndexMarshal := pdwTocIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "int", enumTocPosType, "ptr", pToc, pdwTocIndexMarshal, pdwTocIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Integer} dwTocIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocparser-removetocbyindex
     */
    RemoveTocByIndex(enumTocPosType, dwTocIndex) {
        result := ComCall(8, this, "int", enumTocPosType, "uint", dwTocIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Guid} guidTocType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocparser-removetocbytype
     */
    RemoveTocByType(enumTocPosType, guidTocType) {
        result := ComCall(9, this, "int", enumTocPosType, "ptr", guidTocType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocparser-commit
     */
    Commit() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
