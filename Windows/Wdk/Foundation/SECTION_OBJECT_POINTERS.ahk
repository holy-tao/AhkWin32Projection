#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct SECTION_OBJECT_POINTERS {
    #StructPack 8

    DataSectionObject : IntPtr

    SharedCacheMap : IntPtr

    ImageSectionObject : IntPtr

}
