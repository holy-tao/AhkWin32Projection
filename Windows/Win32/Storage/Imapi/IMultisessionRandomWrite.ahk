#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMultisession.ahk" { IMultisession }

/**
 * Use this interface to retrieve information about the current state of media allowing random writes and not supporting the concept of physical sessions.
 * @remarks
 * If more than one multi-session interface exist, the application can let <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> choose a compatible multi-session interface to use or the application can specify the multi-session interface to use by setting the <i>put_InUse</i> property to <b>VARIANT_TRUE</b>.
 * 
 * A file system creator would use the address properties to import the content of the previous session on the disc and to compute the position of the next session it will create. These properties will return the same values as the properties of the same name of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2data">IDiscFormat2Data</a> interface.
 * This is a <b>MsftMultisessionRandomWrite</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-imultisessionrandomwrite
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMultisessionRandomWrite extends IMultisession {
    /**
     * The interface identifier for IMultisessionRandomWrite
     * @type {Guid}
     */
    static IID := Guid("{b507ca23-2204-11dd-966a-001aa01bbc58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultisessionRandomWrite interfaces
    */
    struct Vtbl extends IMultisession.Vtbl {
        get_WriteUnitSize       : IntPtr
        get_LastWrittenAddress  : IntPtr
        get_TotalSectorsOnMedia : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultisessionRandomWrite.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Retrieves the size of a writable unit on the media. (IMultisessionRandomWrite.get_WriteUnitSize)
     * @remarks
     * Each write performed to the disc must start from an LBA that is a multiple of the writable unit size. The number of recorded sectors must also be a multiple of the writable unit size.
     * @returns {Integer} The size of a writable unit on the media.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionrandomwrite-get_writeunitsize
     */
    get_WriteUnitSize() {
        result := ComCall(11, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the last written address on the media.
     * @remarks
     * This property can be used for wear-out leveling on the media. The property is retrieved from the drive and may not be provided for some media types. If the drive does not provide the required information, this property access method returns <b>E_NOTIMPL</b>.
     * @returns {Integer} The last written address on the media.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionrandomwrite-get_lastwrittenaddress
     */
    get_LastWrittenAddress() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the total number of sectors on the media.
     * @returns {Integer} The total number of sectors on the media.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisessionrandomwrite-get_totalsectorsonmedia
     */
    get_TotalSectorsOnMedia() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IMultisessionRandomWrite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WriteUnitSize := CallbackCreate(GetMethod(implObj, "get_WriteUnitSize"), flags, 2)
        this.vtbl.get_LastWrittenAddress := CallbackCreate(GetMethod(implObj, "get_LastWrittenAddress"), flags, 2)
        this.vtbl.get_TotalSectorsOnMedia := CallbackCreate(GetMethod(implObj, "get_TotalSectorsOnMedia"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WriteUnitSize)
        CallbackFree(this.vtbl.get_LastWrittenAddress)
        CallbackFree(this.vtbl.get_TotalSectorsOnMedia)
    }
}
