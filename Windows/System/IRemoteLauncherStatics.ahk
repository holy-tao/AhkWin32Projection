#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IRemoteLauncherStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteLauncherStatics
     * @type {Guid}
     */
    static IID => Guid("{d7db7a93-a30c-48b7-9f21-051026a4e517}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchUriAsync", "LaunchUriWithOptionsAsync", "LaunchUriWithDataAsync"]

    /**
     * 
     * @param {RemoteSystemConnectionRequest} remoteSystemConnectionRequest_ 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    LaunchUriAsync(remoteSystemConnectionRequest_, uri_) {
        result := ComCall(6, this, "ptr", remoteSystemConnectionRequest_, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {RemoteSystemConnectionRequest} remoteSystemConnectionRequest_ 
     * @param {Uri} uri_ 
     * @param {RemoteLauncherOptions} options 
     * @returns {IAsyncOperation<Integer>} 
     */
    LaunchUriWithOptionsAsync(remoteSystemConnectionRequest_, uri_, options) {
        result := ComCall(7, this, "ptr", remoteSystemConnectionRequest_, "ptr", uri_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {RemoteSystemConnectionRequest} remoteSystemConnectionRequest_ 
     * @param {Uri} uri_ 
     * @param {RemoteLauncherOptions} options 
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<Integer>} 
     */
    LaunchUriWithDataAsync(remoteSystemConnectionRequest_, uri_, options, inputData) {
        result := ComCall(8, this, "ptr", remoteSystemConnectionRequest_, "ptr", uri_, "ptr", options, "ptr", inputData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
