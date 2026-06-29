#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the format and type of a data value. It is used as the Syntax member of the CLUSPROP_VALUE structure.
 * @remarks
 * To parse data that is returned from a 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-functions">control code function</a>, use the 
 *      <b>wFormat</b> member of this structure if the <b>wType</b> member 
 *      defines a type that the application cannot understand.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_syntax
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_SYNTAX {
    #StructPack 4

    /**
     * A DWORD that describes the format and type of the data value. The 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_property_syntax">CLUSTER_PROPERTY_SYNTAX</a> enumeration defines the 
     *        possible values.
     */
    dw : UInt32

    static __New() {
        DefineProp(this.Prototype, 'wFormat', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'wType', { type: UInt16, offset: 2 })
        this.DeleteProp("__New")
    }
}
