#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CONTAINER_ROOT_INFO_OUTPUT {
    #StructPack 2

    ContainerRootIdLength : UInt16

    ContainerRootId : Int8[1]

}
