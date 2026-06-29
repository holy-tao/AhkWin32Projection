#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WMPLibraryType.ahk" { WMPLibraryType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWMPLibrary.ahk" { IWMPLibrary }

/**
 * The IWMPLibraryServices interface provides methods to enumerate libraries.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmplibraryservices
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPLibraryServices extends IUnknown {
    /**
     * The interface identifier for IWMPLibraryServices
     * @type {Guid}
     */
    static IID := Guid("{39c2f8d5-1cf2-4d5e-ae09-d73492cf9eaa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPLibraryServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        getCountByType   : IntPtr
        getLibraryByType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPLibraryServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The getCountByType method retrieves the count of available libraries of a specified type.
     * @remarks
     * To obtain a count of the libraries represented by the wmpltRemote value of the <b>WMPLibraryType</b> enumeration, the Player control must be running in remote mode. For information about running the Player control in remote mode, see <a href="https://docs.microsoft.com/windows/desktop/WMP/remoting-the-windows-media-player-control">Remoting the Windows Media Player Control</a>.
     * 
     * You must initialize the <i>plCount</i> variable before passing in its pointer.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {WMPLibraryType} wmplt <a href="https://docs.microsoft.com/windows/desktop/api/wmp/ne-wmp-wmplibrarytype">WMPLibraryType</a> enumeration value that specifies the type of library to count.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> that receives the library count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibraryservices-getcountbytype
     */
    getCountByType(wmplt, plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, WMPLibraryType, wmplt, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getLibraryByType method retrieves a pointer to an IWMPLibrary interface that represents the library that has the specified type and index.
     * @remarks
     * There is only one local library and disc libraries are available only on data CDs and DVDs that contain media content.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {WMPLibraryType} wmplt <b>WMPLibraryType</b> enumeration value that specifies the type of library to retrieve.
     * @param {Integer} lIndex A <b>long</b> containing the index of the library to retrieve.
     * @returns {IWMPLibrary} Address of a variable that receives a pointer to the retrieved <b>IWMPLibrary</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibraryservices-getlibrarybytype
     */
    getLibraryByType(wmplt, lIndex) {
        result := ComCall(4, this, WMPLibraryType, wmplt, "int", lIndex, "ptr*", &ppIWMPLibrary := 0, "HRESULT")
        return IWMPLibrary(ppIWMPLibrary)
    }

    Query(iid) {
        if (IWMPLibraryServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getCountByType := CallbackCreate(GetMethod(implObj, "getCountByType"), flags, 3)
        this.vtbl.getLibraryByType := CallbackCreate(GetMethod(implObj, "getLibraryByType"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getCountByType)
        CallbackFree(this.vtbl.getLibraryByType)
    }
}
