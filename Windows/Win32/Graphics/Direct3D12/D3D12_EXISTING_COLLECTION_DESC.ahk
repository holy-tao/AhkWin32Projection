#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D12StateObject.ahk" { ID3D12StateObject }
#Import ".\D3D12_EXPORT_DESC.ahk" { D3D12_EXPORT_DESC }

/**
 * A state subobject describing an existing collection that can be included in a state object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_existing_collection_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_EXISTING_COLLECTION_DESC {
    #StructPack 8

    /**
     * The collection to include in a state object.   The enclosing state object holds a reference to the existing collection.
     */
    pExistingCollection : ID3D12StateObject

    /**
     * Size of the <i>pExports</i> array.  If 0, all of the collection’s exports get exported.
     */
    NumExports : UInt32

    pExports : D3D12_EXPORT_DESC.Ptr

}
