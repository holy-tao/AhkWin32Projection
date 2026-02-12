#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * For internal use only.
  * 
  * > [IMPORTANT]
  * > These interfaces exist so that the Windows **Files** app can implement them for purposes of integrating with other file providers. These interfaces aren't for general use, and any implementation that you author won't be called by the operating system (OS).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.implementation.fileexplorer.isysstorageprovidereventsource
 * @namespace Windows.System.Implementation.FileExplorer
 * @version WindowsRuntime 1.4
 */
class ISysStorageProviderEventSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISysStorageProviderEventSource
     * @type {Guid}
     */
    static IID => Guid("{1f36c476-9546-536a-8381-2f9a2c08cedd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_EventReceived", "remove_EventReceived"]

    /**
     * 
     * @param {TypedEventHandler<ISysStorageProviderEventSource, SysStorageProviderEventReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EventReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_EventReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
