#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyFile.ahk

/**
 * Use the IBackgroundCopyFile2 interface to specify a new remote name for the file and retrieve the list of ranges to download.
 * @see https://docs.microsoft.com/windows/win32/api//bits2_0/nn-bits2_0-ibackgroundcopyfile2
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile2 extends IBackgroundCopyFile{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyFile2
     * @type {Guid}
     */
    static IID => Guid("{83e81b93-0873-474d-8a8c-f2018b1a939c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileRanges", "SetRemoteName"]

    /**
     * 
     * @param {Pointer<Integer>} RangeCount 
     * @param {Pointer<Pointer<BG_FILE_RANGE>>} Ranges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyfile2-getfileranges
     */
    GetFileRanges(RangeCount, Ranges) {
        RangeCountMarshal := RangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, RangeCountMarshal, RangeCount, "ptr*", Ranges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyfile2-setremotename
     */
    SetRemoteName(Val) {
        Val := Val is String ? StrPtr(Val) : Val

        result := ComCall(7, this, "ptr", Val, "HRESULT")
        return result
    }
}
