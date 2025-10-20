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
     * 
     * @param {PWSTR} pwszTitle 
     * @returns {HRESULT} 
     */
    SetTitle(pwszTitle) {
        pwszTitle := pwszTitle is String ? StrPtr(pwszTitle) : pwszTitle

        result := ComCall(3, this, "ptr", pwszTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwTitleSize 
     * @param {PWSTR} pwszTitle 
     * @returns {HRESULT} 
     */
    GetTitle(pwTitleSize, pwszTitle) {
        pwszTitle := pwszTitle is String ? StrPtr(pwszTitle) : pwszTitle

        result := ComCall(4, this, "ushort*", pwTitleSize, "ptr", pwszTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TOC_ENTRY_DESCRIPTOR>} pDescriptor 
     * @returns {HRESULT} 
     */
    SetDescriptor(pDescriptor) {
        result := ComCall(5, this, "ptr", pDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TOC_ENTRY_DESCRIPTOR>} pDescriptor 
     * @returns {HRESULT} 
     */
    GetDescriptor(pDescriptor) {
        result := ComCall(6, this, "ptr", pDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNumSubEntries 
     * @param {Pointer<UInt16>} pwSubEntryIndices 
     * @returns {HRESULT} 
     */
    SetSubEntries(dwNumSubEntries, pwSubEntryIndices) {
        result := ComCall(7, this, "uint", dwNumSubEntries, "ushort*", pwSubEntryIndices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwNumSubEntries 
     * @param {Pointer<UInt16>} pwSubEntryIndices 
     * @returns {HRESULT} 
     */
    GetSubEntries(pdwNumSubEntries, pwSubEntryIndices) {
        result := ComCall(8, this, "uint*", pdwNumSubEntries, "ushort*", pwSubEntryIndices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDescriptionDataSize 
     * @param {Pointer<Byte>} pbtDescriptionData 
     * @param {Pointer<Guid>} pguidType 
     * @returns {HRESULT} 
     */
    SetDescriptionData(dwDescriptionDataSize, pbtDescriptionData, pguidType) {
        result := ComCall(9, this, "uint", dwDescriptionDataSize, "char*", pbtDescriptionData, "ptr", pguidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwDescriptionDataSize 
     * @param {Pointer<Byte>} pbtDescriptionData 
     * @param {Pointer<Guid>} pGuidType 
     * @returns {HRESULT} 
     */
    GetDescriptionData(pdwDescriptionDataSize, pbtDescriptionData, pGuidType) {
        result := ComCall(10, this, "uint*", pdwDescriptionDataSize, "char*", pbtDescriptionData, "ptr", pGuidType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
