#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains the text recognition data properties retrieved by MappingRecognizeText.
 * @remarks
 * 
 * The memory for the property bag structure itself is managed by the application. The ELS platform and its services only manage the data pointers that they store in the property bag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//elscore/ns-elscore-mapping_property_bag
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MAPPING_PROPERTY_BAG extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Size of the structure, used to verify the structure version. This value is required.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_data_range">MAPPING_DATA_RANGE</a> structures containing all recognized text range results. This member is populated by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     * @type {Pointer<MAPPING_DATA_RANGE>}
     */
    prgResultRanges {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Number of items in the array indicated by <b>prgResultRanges</b>. This member is populated by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     * @type {Integer}
     */
    dwRangesCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to private service data. The service can document the format of this data so that the application can use it. The service also manages the memory for this data. This member is populated by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     * @type {Pointer<Void>}
     */
    pServiceData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Size, in bytes, of the private service data specified by <b>pServiceData</b>. The size is set to 0 if there is no private data. This member is populated by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     * @type {Integer}
     */
    dwServiceDataSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to private application data to pass to the service. The application manages the memory for this data.
     * @type {Pointer<Void>}
     */
    pCallerData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Size, in bytes, of the private application data indicated in <b>pCallerData</b>. This member is set to 0 if there is no private data.
     * @type {Integer}
     */
    dwCallerDataSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved for internal use.
     * @type {Pointer<Void>}
     */
    pContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
