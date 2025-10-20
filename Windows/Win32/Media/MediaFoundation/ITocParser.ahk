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
     * 
     * @param {PWSTR} pwszFileName 
     * @returns {HRESULT} 
     */
    Init(pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "ptr", pwszFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Pointer<UInt32>} pdwTocCount 
     * @returns {HRESULT} 
     */
    GetTocCount(enumTocPosType, pdwTocCount) {
        result := ComCall(4, this, "int", enumTocPosType, "uint*", pdwTocCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Integer} dwTocIndex 
     * @param {Pointer<IToc>} ppToc 
     * @returns {HRESULT} 
     */
    GetTocByIndex(enumTocPosType, dwTocIndex, ppToc) {
        result := ComCall(5, this, "int", enumTocPosType, "uint", dwTocIndex, "ptr", ppToc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Pointer<Guid>} guidTocType 
     * @param {Pointer<ITocCollection>} ppTocs 
     * @returns {HRESULT} 
     */
    GetTocByType(enumTocPosType, guidTocType, ppTocs) {
        result := ComCall(6, this, "int", enumTocPosType, "ptr", guidTocType, "ptr", ppTocs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Pointer<IToc>} pToc 
     * @param {Pointer<UInt32>} pdwTocIndex 
     * @returns {HRESULT} 
     */
    AddToc(enumTocPosType, pToc, pdwTocIndex) {
        result := ComCall(7, this, "int", enumTocPosType, "ptr", pToc, "uint*", pdwTocIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Integer} dwTocIndex 
     * @returns {HRESULT} 
     */
    RemoveTocByIndex(enumTocPosType, dwTocIndex) {
        result := ComCall(8, this, "int", enumTocPosType, "uint", dwTocIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enumTocPosType 
     * @param {Pointer<Guid>} guidTocType 
     * @returns {HRESULT} 
     */
    RemoveTocByType(enumTocPosType, guidTocType) {
        result := ComCall(9, this, "int", enumTocPosType, "ptr", guidTocType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
