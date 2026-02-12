#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IRandomAccessStreamReferenceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRandomAccessStreamReferenceStatics
     * @type {Guid}
     */
    static IID => Guid("{857309dc-3fbf-4e7d-986f-ef3b1a07a964}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromFile", "CreateFromUri", "CreateFromStream"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {RandomAccessStreamReference} 
     */
    CreateFromFile(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &streamReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RandomAccessStreamReference(streamReference)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {RandomAccessStreamReference} 
     */
    CreateFromUri(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &streamReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RandomAccessStreamReference(streamReference)
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @returns {RandomAccessStreamReference} 
     */
    CreateFromStream(stream) {
        result := ComCall(8, this, "ptr", stream, "ptr*", &streamReference := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RandomAccessStreamReference(streamReference)
    }
}
