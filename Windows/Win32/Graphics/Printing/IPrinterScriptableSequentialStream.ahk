#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptableSequentialStream extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterScriptableSequentialStream
     * @type {Guid}
     */
    static IID => Guid("{2072838a-316f-467a-a949-27f68c44a854}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write"]

    /**
     * The ReadBlobFromFile function reads a BLOB in a file.
     * @param {Integer} cbRead 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/readblobfromfile
     */
    Read(cbRead) {
        result := ComCall(7, this, "int", cbRead, "ptr*", &ppArray := 0, "HRESULT")
        return IDispatch(ppArray)
    }

    /**
     * The WriteBackRootHintDatafile method writes the RootHints back to the DNS Cache file.
     * @param {IDispatch} pArray 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DNS/microsoftdns-roothints-writebackroothintdatafile
     */
    Write(pArray) {
        result := ComCall(8, this, "ptr", pArray, "int*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }
}
