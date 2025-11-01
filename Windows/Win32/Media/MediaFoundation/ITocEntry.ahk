#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITocEntry interface represents an individual entry in a table of contents. It provides methods for setting and retrieving descriptive information for the entry.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-itocentry
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ITocEntry extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITocEntry
     * @type {Guid}
     */
    static IID => Guid("{f22f5e06-585c-4def-8523-6555cfbc0cb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTitle", "GetTitle", "SetDescriptor", "GetDescriptor", "SetSubEntries", "GetSubEntries", "SetDescriptionData", "GetDescriptionData"]

    /**
     * 
     * @param {PWSTR} pwszTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-settitle
     */
    SetTitle(pwszTitle) {
        pwszTitle := pwszTitle is String ? StrPtr(pwszTitle) : pwszTitle

        result := ComCall(3, this, "ptr", pwszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwTitleSize 
     * @param {PWSTR} pwszTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-gettitle
     */
    GetTitle(pwTitleSize, pwszTitle) {
        pwszTitle := pwszTitle is String ? StrPtr(pwszTitle) : pwszTitle

        result := ComCall(4, this, "ushort*", pwTitleSize, "ptr", pwszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TOC_ENTRY_DESCRIPTOR>} pDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-setdescriptor
     */
    SetDescriptor(pDescriptor) {
        result := ComCall(5, this, "ptr", pDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TOC_ENTRY_DESCRIPTOR>} pDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-getdescriptor
     */
    GetDescriptor(pDescriptor) {
        result := ComCall(6, this, "ptr", pDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNumSubEntries 
     * @param {Pointer<Integer>} pwSubEntryIndices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-setsubentries
     */
    SetSubEntries(dwNumSubEntries, pwSubEntryIndices) {
        result := ComCall(7, this, "uint", dwNumSubEntries, "ushort*", pwSubEntryIndices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwNumSubEntries 
     * @param {Pointer<Integer>} pwSubEntryIndices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-getsubentries
     */
    GetSubEntries(pdwNumSubEntries, pwSubEntryIndices) {
        result := ComCall(8, this, "uint*", pdwNumSubEntries, "ushort*", pwSubEntryIndices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDescriptionDataSize 
     * @param {Pointer<Integer>} pbtDescriptionData 
     * @param {Pointer<Guid>} pguidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-setdescriptiondata
     */
    SetDescriptionData(dwDescriptionDataSize, pbtDescriptionData, pguidType) {
        result := ComCall(9, this, "uint", dwDescriptionDataSize, "char*", pbtDescriptionData, "ptr", pguidType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwDescriptionDataSize 
     * @param {Pointer<Integer>} pbtDescriptionData 
     * @param {Pointer<Guid>} pGuidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentry-getdescriptiondata
     */
    GetDescriptionData(pdwDescriptionDataSize, pbtDescriptionData, pGuidType) {
        result := ComCall(10, this, "uint*", pdwDescriptionDataSize, "char*", pbtDescriptionData, "ptr", pGuidType, "HRESULT")
        return result
    }
}
