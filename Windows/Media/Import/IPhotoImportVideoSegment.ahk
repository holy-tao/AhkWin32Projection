#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\PhotoImportSidecar.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportVideoSegment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportVideoSegment
     * @type {Guid}
     */
    static IID => Guid("{623c0289-321a-41d8-9166-8c62a333276c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_SizeInBytes", "get_Date", "get_Sibling", "get_Sidecars"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    SizeInBytes {
        get => this.get_SizeInBytes()
    }

    /**
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * @type {PhotoImportSidecar} 
     */
    Sibling {
        get => this.get_Sibling()
    }

    /**
     * @type {IVectorView<PhotoImportSidecar>} 
     */
    Sidecars {
        get => this.get_Sidecars()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SizeInBytes() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PhotoImportSidecar} 
     */
    get_Sibling() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhotoImportSidecar(value)
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportSidecar>} 
     */
    get_Sidecars() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PhotoImportSidecar, value)
    }
}
