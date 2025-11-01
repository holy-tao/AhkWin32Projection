#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob2.ahk

/**
 * Use the IBackgroundCopyJob3 interface to download ranges of a file and change the prefix of a remote file name.
 * @see https://docs.microsoft.com/windows/win32/api//bits2_0/nn-bits2_0-ibackgroundcopyjob3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob3 extends IBackgroundCopyJob2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJob3
     * @type {Guid}
     */
    static IID => Guid("{443c8934-90ff-48ed-bcde-26f5c7450042}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReplaceRemotePrefix", "AddFileWithRanges", "SetFileACLFlags", "GetFileACLFlags"]

    /**
     * 
     * @param {PWSTR} OldPrefix 
     * @param {PWSTR} NewPrefix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-replaceremoteprefix
     */
    ReplaceRemotePrefix(OldPrefix, NewPrefix) {
        OldPrefix := OldPrefix is String ? StrPtr(OldPrefix) : OldPrefix
        NewPrefix := NewPrefix is String ? StrPtr(NewPrefix) : NewPrefix

        result := ComCall(43, this, "ptr", OldPrefix, "ptr", NewPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} RemoteUrl 
     * @param {PWSTR} LocalName 
     * @param {Integer} RangeCount 
     * @param {Pointer<BG_FILE_RANGE>} Ranges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-addfilewithranges
     */
    AddFileWithRanges(RemoteUrl, LocalName, RangeCount, Ranges) {
        RemoteUrl := RemoteUrl is String ? StrPtr(RemoteUrl) : RemoteUrl
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName

        result := ComCall(44, this, "ptr", RemoteUrl, "ptr", LocalName, "uint", RangeCount, "ptr", Ranges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-setfileaclflags
     */
    SetFileACLFlags(Flags) {
        result := ComCall(45, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-getfileaclflags
     */
    GetFileACLFlags(Flags) {
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, FlagsMarshal, Flags, "HRESULT")
        return result
    }
}
