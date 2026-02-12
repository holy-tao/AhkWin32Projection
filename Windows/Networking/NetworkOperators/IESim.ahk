#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ESimPolicy.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ESimProfile.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ESimOperationResult.ahk
#Include .\ESimDownloadProfileMetadataResult.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESim extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESim
     * @type {Guid}
     */
    static IID => Guid("{6f6e6e26-f123-437d-8ced-dc1d2bc0c3a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AvailableMemoryInBytes", "get_Eid", "get_FirmwareVersion", "get_MobileBroadbandModemDeviceId", "get_Policy", "get_State", "GetProfiles", "DeleteProfileAsync", "DownloadProfileMetadataAsync", "ResetAsync", "add_ProfileChanged", "remove_ProfileChanged"]

    /**
     * @type {IReference<Integer>} 
     */
    AvailableMemoryInBytes {
        get => this.get_AvailableMemoryInBytes()
    }

    /**
     * @type {HSTRING} 
     */
    Eid {
        get => this.get_Eid()
    }

    /**
     * @type {HSTRING} 
     */
    FirmwareVersion {
        get => this.get_FirmwareVersion()
    }

    /**
     * @type {HSTRING} 
     */
    MobileBroadbandModemDeviceId {
        get => this.get_MobileBroadbandModemDeviceId()
    }

    /**
     * @type {ESimPolicy} 
     */
    Policy {
        get => this.get_Policy()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_AvailableMemoryInBytes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Eid() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirmwareVersion() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MobileBroadbandModemDeviceId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ESimPolicy} 
     */
    get_Policy() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimPolicy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the path to the root directory where user profiles are stored. (Unicode)
     * @remarks
     * The following is an example of the path returned by <b>GetProfilesDirectory</b> in Windows XP:
     * 
     * 
     * ``` syntax
     * C:\Documents and Settings
     * ```
     * 
     * The following is an example of the path returned by <b>GetProfilesDirectory</b> in Windows 7:
     * 
     * 
     * ``` syntax
     * C:\Users
     * ```
     * 
     * To obtain the paths of subdirectories of this directory, use the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetfolderpatha">SHGetFolderPath</a> (Windows XP and earlier) or <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderpath">SHGetKnownFolderPath</a> (Windows Vista) function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The userenv.h header defines GetProfilesDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {IVectorView<ESimProfile>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/userenv/nf-userenv-getprofilesdirectoryw
     */
    GetProfiles() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ESimProfile, result_)
    }

    /**
     * 
     * @param {HSTRING} profileId 
     * @returns {IAsyncOperation<ESimOperationResult>} 
     */
    DeleteProfileAsync(profileId) {
        if(profileId is String) {
            pin := HSTRING.Create(profileId)
            profileId := pin.Value
        }
        profileId := profileId is Win32Handle ? NumGet(profileId, "ptr") : profileId

        result := ComCall(13, this, "ptr", profileId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimOperationResult, operation)
    }

    /**
     * 
     * @param {HSTRING} activationCode 
     * @returns {IAsyncOperation<ESimDownloadProfileMetadataResult>} 
     */
    DownloadProfileMetadataAsync(activationCode) {
        if(activationCode is String) {
            pin := HSTRING.Create(activationCode)
            activationCode := pin.Value
        }
        activationCode := activationCode is Win32Handle ? NumGet(activationCode, "ptr") : activationCode

        result := ComCall(14, this, "ptr", activationCode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimDownloadProfileMetadataResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<ESimOperationResult>} 
     */
    ResetAsync() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ESimOperationResult, operation)
    }

    /**
     * 
     * @param {TypedEventHandler<ESim, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProfileChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProfileChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
