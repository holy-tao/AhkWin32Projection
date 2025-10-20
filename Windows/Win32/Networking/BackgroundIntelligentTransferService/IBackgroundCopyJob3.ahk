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
     * 
     * @param {PWSTR} OldPrefix 
     * @param {PWSTR} NewPrefix 
     * @returns {HRESULT} 
     */
    ReplaceRemotePrefix(OldPrefix, NewPrefix) {
        OldPrefix := OldPrefix is String ? StrPtr(OldPrefix) : OldPrefix
        NewPrefix := NewPrefix is String ? StrPtr(NewPrefix) : NewPrefix

        result := ComCall(43, this, "ptr", OldPrefix, "ptr", NewPrefix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} RemoteUrl 
     * @param {PWSTR} LocalName 
     * @param {Integer} RangeCount 
     * @param {Pointer<BG_FILE_RANGE>} Ranges 
     * @returns {HRESULT} 
     */
    AddFileWithRanges(RemoteUrl, LocalName, RangeCount, Ranges) {
        RemoteUrl := RemoteUrl is String ? StrPtr(RemoteUrl) : RemoteUrl
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName

        result := ComCall(44, this, "ptr", RemoteUrl, "ptr", LocalName, "uint", RangeCount, "ptr", Ranges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetFileACLFlags(Flags) {
        result := ComCall(45, this, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Flags 
     * @returns {HRESULT} 
     */
    GetFileACLFlags(Flags) {
        result := ComCall(46, this, "uint*", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
