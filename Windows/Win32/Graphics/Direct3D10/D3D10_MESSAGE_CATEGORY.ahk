#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Categories of debug messages. (D3D10_MESSAGE_CATEGORY)
 * @remarks
 * This is part of the Information Queue feature. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nn-d3d10sdklayers-id3d10infoqueue">ID3D10InfoQueue Interface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_MESSAGE_CATEGORY extends Win32Enum {

    /**
     * User defined message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addmessage">ID3D10InfoQueue::AddMessage</a>.
     * Native name: D3D10_MESSAGE_CATEGORY_APPLICATION_DEFINED
     * @type {Integer (Int32)}
     */
    static APPLICATION_DEFINED => 0

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_MISCELLANEOUS
     * @type {Integer (Int32)}
     */
    static MISCELLANEOUS => 1

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_INITIALIZATION
     * @type {Integer (Int32)}
     */
    static INITIALIZATION => 2

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_CLEANUP
     * @type {Integer (Int32)}
     */
    static CLEANUP => 3

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_COMPILATION
     * @type {Integer (Int32)}
     */
    static COMPILATION => 4

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_STATE_CREATION
     * @type {Integer (Int32)}
     */
    static STATE_CREATION => 5

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_STATE_SETTING
     * @type {Integer (Int32)}
     */
    static STATE_SETTING => 6

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_STATE_GETTING
     * @type {Integer (Int32)}
     */
    static STATE_GETTING => 7

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_RESOURCE_MANIPULATION
     * @type {Integer (Int32)}
     */
    static RESOURCE_MANIPULATION => 8

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_EXECUTION
     * @type {Integer (Int32)}
     */
    static EXECUTION => 9

    /**
     * Native name: D3D10_MESSAGE_CATEGORY_SHADER
     * @type {Integer (Int32)}
     */
    static SHADER => 10
}
