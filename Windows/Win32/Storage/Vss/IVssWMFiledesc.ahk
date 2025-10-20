#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssWMFiledesc interface is a C++ (not COM) interface returned to a calling application by a number of query methods. It provides detailed information about a file or set of files (a file set).
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsswmfiledesc
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssWMFiledesc extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPath", "GetFilespec", "GetRecursive", "GetAlternateLocation", "GetBackupTypeMask"]

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<BSTR>} pbstrPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pbstrPath) {
        result := ComCall(3, this, "ptr", pbstrPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFilespec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getfilespec
     */
    GetFilespec(pbstrFilespec) {
        result := ComCall(4, this, "ptr", pbstrFilespec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbRecursive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getrecursive
     */
    GetRecursive(pbRecursive) {
        result := ComCall(5, this, "int*", pbRecursive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAlternateLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getalternatelocation
     */
    GetAlternateLocation(pbstrAlternateLocation) {
        result := ComCall(6, this, "ptr", pbstrAlternateLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwTypeMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswmfiledesc-getbackuptypemask
     */
    GetBackupTypeMask(pdwTypeMask) {
        result := ComCall(7, this, "uint*", pdwTypeMask, "HRESULT")
        return result
    }
}
