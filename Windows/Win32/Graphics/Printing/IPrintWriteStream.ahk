#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintWriteStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWriteStream
     * @type {Guid}
     */
    static IID => Guid("{65bb7f1b-371e-4571-8ac7-912f510c1a38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteBytes", "Close"]

    /**
     * 
     * @param {Pointer} pvBuffer 
     * @param {Integer} cbBuffer 
     * @returns {Integer} 
     */
    WriteBytes(pvBuffer, cbBuffer) {
        result := ComCall(3, this, "ptr", pvBuffer, "uint", cbBuffer, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * Use the Close-Session packet to tell the BITS server that file upload is complete and to end the session.
     * @remarks
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * For upload-reply jobs, you must download the reply before sending **Close-Session**. Otherwise, the reply is lost.
     * 
     * If you send this packet before uploading all fragments, the upload file is deleted; you cannot upload a partial file.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Bits/close-session
     */
    Close() {
        ComCall(4, this)
    }
}
