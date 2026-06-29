#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct RTL_SPLAY_LINKS {
    #StructPack 8

    Parent : RTL_SPLAY_LINKS.Ptr

    LeftChild : RTL_SPLAY_LINKS.Ptr

    RightChild : RTL_SPLAY_LINKS.Ptr

}
