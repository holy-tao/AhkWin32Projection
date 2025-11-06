#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSManEx.ahk

/**
 * Extends the methods and properties of the IWSManEx interface to include a method that returns a session flag value related to authentication using client certificates.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanex2
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManEx2 extends IWSManEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManEx2
     * @type {Guid}
     */
    static IID => Guid("{1d1b5ae0-42d9-4021-8261-3987619512e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SessionFlagUseClientCertificate"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex2-sessionflaguseclientcertificate
     */
    SessionFlagUseClientCertificate() {
        result := ComCall(31, this, "int*", &flags := 0, "HRESULT")
        return flags
    }
}
