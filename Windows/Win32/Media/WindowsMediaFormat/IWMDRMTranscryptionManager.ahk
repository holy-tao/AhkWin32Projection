#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMTranscryptor.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMTranscryptionManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMTranscryptionManager
     * @type {Guid}
     */
    static IID => Guid("{b1a887b2-a4f0-407a-b02e-efbd23bbecdf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTranscryptor"]

    /**
     * 
     * @returns {IWMDRMTranscryptor} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptionmanager-createtranscryptor
     */
    CreateTranscryptor() {
        result := ComCall(3, this, "ptr*", &ppTranscryptor := 0, "HRESULT")
        return IWMDRMTranscryptor(ppTranscryptor)
    }
}
