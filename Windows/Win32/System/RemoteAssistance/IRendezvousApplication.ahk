#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes a method used by an instant messaging (IM) application to create a remote assistance session.
 * @remarks
 * 
  * After an IM contact has accepted the remote assistance invitation, the IM application must instantiate the Windows Remote Assistance application on both sides of the connection by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> on the Windows Remote Assistance application's <b>IRendezvousApplication</b> interface. 
  * 
  * The IM application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/rendezvoussession/nf-rendezvoussession-irendezvousapplication-setrendezvoussession">SetRendezvousSession</a> method to pass its implementation of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/rendezvoussession/nn-rendezvoussession-irendezvoussession">IRendezvousSession</a> interface to the Windows Remote Assistance application.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/nn-rendezvoussession-irendezvousapplication
 * @namespace Windows.Win32.System.RemoteAssistance
 * @version v4.0.30319
 */
class IRendezvousApplication extends IUnknown{
    /**
     * The interface identifier for IRendezvousApplication
     * @type {Guid}
     */
    static IID => Guid("{4f4d070b-a275-49fb-b10d-8ec26387b50d}")

    /**
     * The class identifier for RendezvousApplication
     * @type {Guid}
     */
    static CLSID => Guid("{0b7e019a-b5de-47fa-8966-9082f82fb192}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pRendezvousSession 
     * @returns {HRESULT} 
     */
    SetRendezvousSession(pRendezvousSession) {
        result := ComCall(3, this, "ptr", pRendezvousSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
