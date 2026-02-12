#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMdmSessionManagerStatics.ahk
#Include ..\..\Guid.ahk

/**
 * This is used as an entry point for creating new sessions, viewing old sessions, or cleanup.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsessionmanager
 * @namespace Windows.Management
 * @version WindowsRuntime 1.4
 */
class MdmSessionManager extends IInspectable {
;@region Static Properties
    /**
     * Gets all MDM session IDs for the current enterprise account.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsessionmanager.sessionids
     * @type {IVectorView<HSTRING>} 
     */
    static SessionIds {
        get => MdmSessionManager.get_SessionIds()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_SessionIds() {
        if (!MdmSessionManager.HasProp("__IMdmSessionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.MdmSessionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmSessionManagerStatics.IID)
            MdmSessionManager.__IMdmSessionManagerStatics := IMdmSessionManagerStatics(factoryPtr)
        }

        return MdmSessionManager.__IMdmSessionManagerStatics.get_SessionIds()
    }

    /**
     * Attempts to start an MDM session for the current enterprise account.
     * @returns {MdmSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsessionmanager.trycreatesession
     */
    static TryCreateSession() {
        if (!MdmSessionManager.HasProp("__IMdmSessionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.MdmSessionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmSessionManagerStatics.IID)
            MdmSessionManager.__IMdmSessionManagerStatics := IMdmSessionManagerStatics(factoryPtr)
        }

        return MdmSessionManager.__IMdmSessionManagerStatics.TryCreateSession()
    }

    /**
     * Deletes past session information.
     * @remarks
     * The caller must wait until the session if finished running (in the background) until it can be deleted.
     * @param {HSTRING} sessionId The string value of the session ID.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsessionmanager.deletesessionbyid
     */
    static DeleteSessionById(sessionId) {
        if (!MdmSessionManager.HasProp("__IMdmSessionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.MdmSessionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmSessionManagerStatics.IID)
            MdmSessionManager.__IMdmSessionManagerStatics := IMdmSessionManagerStatics(factoryPtr)
        }

        return MdmSessionManager.__IMdmSessionManagerStatics.DeleteSessionById(sessionId)
    }

    /**
     * Gets the MDM session's information given the session's ID.
     * @param {HSTRING} sessionId The string value of the MDM session ID.
     * @returns {MdmSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsessionmanager.getsessionbyid
     */
    static GetSessionById(sessionId) {
        if (!MdmSessionManager.HasProp("__IMdmSessionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.MdmSessionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmSessionManagerStatics.IID)
            MdmSessionManager.__IMdmSessionManagerStatics := IMdmSessionManagerStatics(factoryPtr)
        }

        return MdmSessionManager.__IMdmSessionManagerStatics.GetSessionById(sessionId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
