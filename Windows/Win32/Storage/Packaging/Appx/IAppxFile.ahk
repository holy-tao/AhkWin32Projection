#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Retrieves information about a payload or footprint file in a package.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxfile
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFile extends IUnknown{
    /**
     * The interface identifier for IAppxFile
     * @type {Guid}
     */
    static IID => Guid("{91df827b-94fd-468f-827b-57f41b2f6f2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} compressionOption 
     * @returns {HRESULT} 
     */
    GetCompressionOption(compressionOption) {
        result := ComCall(3, this, "int*", compressionOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} contentType 
     * @returns {HRESULT} 
     */
    GetContentType(contentType) {
        result := ComCall(4, this, "ptr", contentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} fileName 
     * @returns {HRESULT} 
     */
    GetName(fileName) {
        result := ComCall(5, this, "ptr", fileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} size 
     * @returns {HRESULT} 
     */
    GetSize(size) {
        result := ComCall(6, this, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @returns {HRESULT} 
     */
    GetStream(stream) {
        result := ComCall(7, this, "ptr", stream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
