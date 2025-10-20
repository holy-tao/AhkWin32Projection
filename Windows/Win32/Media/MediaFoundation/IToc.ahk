#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IToc interface represents an individual table of contents. It provides methods for adding entries to, and removing entries from the table of contents.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-itoc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IToc extends IUnknown{
    /**
     * The interface identifier for IToc
     * @type {Guid}
     */
    static IID => Guid("{d6f05441-a919-423b-91a0-89d5b4a8ab77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<TOC_DESCRIPTOR>} pDescriptor 
     * @returns {HRESULT} 
     */
    SetDescriptor(pDescriptor) {
        result := ComCall(3, this, "ptr", pDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TOC_DESCRIPTOR>} pDescriptor 
     * @returns {HRESULT} 
     */
    GetDescriptor(pDescriptor) {
        result := ComCall(4, this, "ptr", pDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDescription 
     * @returns {HRESULT} 
     */
    SetDescription(pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(5, this, "ptr", pwszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwDescriptionSize 
     * @param {PWSTR} pwszDescription 
     * @returns {HRESULT} 
     */
    GetDescription(pwDescriptionSize, pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(6, this, "ushort*", pwDescriptionSize, "ptr", pwszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwContextSize 
     * @param {Pointer<Byte>} pbtContext 
     * @returns {HRESULT} 
     */
    SetContext(dwContextSize, pbtContext) {
        result := ComCall(7, this, "uint", dwContextSize, "char*", pbtContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwContextSize 
     * @param {Pointer<Byte>} pbtContext 
     * @returns {HRESULT} 
     */
    GetContext(pdwContextSize, pbtContext) {
        result := ComCall(8, this, "uint*", pdwContextSize, "char*", pbtContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwCount 
     * @returns {HRESULT} 
     */
    GetEntryListCount(pwCount) {
        result := ComCall(9, this, "ushort*", pwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wEntryListIndex 
     * @param {Pointer<ITocEntryList>} ppEntryList 
     * @returns {HRESULT} 
     */
    GetEntryListByIndex(wEntryListIndex, ppEntryList) {
        result := ComCall(10, this, "ushort", wEntryListIndex, "ptr", ppEntryList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITocEntryList>} pEntryList 
     * @param {Pointer<UInt16>} pwEntryListIndex 
     * @returns {HRESULT} 
     */
    AddEntryList(pEntryList, pwEntryListIndex) {
        result := ComCall(11, this, "ptr", pEntryList, "ushort*", pwEntryListIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wEntryListIndex 
     * @param {Pointer<ITocEntryList>} pEntryList 
     * @returns {HRESULT} 
     */
    AddEntryListByIndex(wEntryListIndex, pEntryList) {
        result := ComCall(12, this, "ushort", wEntryListIndex, "ptr", pEntryList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wEntryListIndex 
     * @returns {HRESULT} 
     */
    RemoveEntryListByIndex(wEntryListIndex) {
        result := ComCall(13, this, "ushort", wEntryListIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
