#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMultisession.ahk

/**
 * Use this interface to retrieve information about the current state of media allowing random writes and not supporting the concept of physical sessions.
 * @remarks
 * 
 * If more than one multi-session interface exist, the application can let <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> choose a compatible multi-session interface to use or the application can specify the multi-session interface to use by setting the <i>put_InUse</i> property to <b>VARIANT_TRUE</b>.
 * 
 * A file system creator would use the address properties to import the content of the previous session on the disc and to compute the position of the next session it will create. These properties will return the same values as the properties of the same name of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2data">IDiscFormat2Data</a> interface.
 * This is a <b>MsftMultisessionRandomWrite</b> object in script.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-imultisessionrandomwrite
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMultisessionRandomWrite extends IMultisession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultisessionRandomWrite
     * @type {Guid}
     */
    static IID => Guid("{b507ca23-2204-11dd-966a-001aa01bbc58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WriteUnitSize", "get_LastWrittenAddress", "get_TotalSectorsOnMedia"]

    /**
     * @type {Integer} 
     */
    WriteUnitSize {
        get => this.get_WriteUnitSize()
    }

    /**
     * @type {Integer} 
     */
    LastWrittenAddress {
        get => this.get_LastWrittenAddress()
    }

    /**
     * @type {Integer} 
     */
    TotalSectorsOnMedia {
        get => this.get_TotalSectorsOnMedia()
    }

    /**
     * Retrieves the size of a writeable unit on the media.
     * @returns {Integer} The size of a writeable unit on the media.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisessionrandomwrite-get_writeunitsize
     */
    get_WriteUnitSize() {
        result := ComCall(11, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the last written address on the media.
     * @returns {Integer} The last written address on the media.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisessionrandomwrite-get_lastwrittenaddress
     */
    get_LastWrittenAddress() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the total number of sectors on the media.
     * @returns {Integer} The total number of sectors on the media.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisessionrandomwrite-get_totalsectorsonmedia
     */
    get_TotalSectorsOnMedia() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
