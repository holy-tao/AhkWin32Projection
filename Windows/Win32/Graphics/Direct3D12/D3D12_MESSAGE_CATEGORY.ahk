#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies categories of debug messages.
 * @remarks
 * This is part of the Information Queue feature, refer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a> Interface.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_MESSAGE_CATEGORY extends Win32Enum {

    /**
     * Indicates a user defined message, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12infoqueue-addmessage">ID3D12InfoQueue::AddMessage</a>.
     * Native name: D3D12_MESSAGE_CATEGORY_APPLICATION_DEFINED
     * @type {Integer (Int32)}
     */
    static APPLICATION_DEFINED => 0

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_MISCELLANEOUS
     * @type {Integer (Int32)}
     */
    static MISCELLANEOUS => 1

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_INITIALIZATION
     * @type {Integer (Int32)}
     */
    static INITIALIZATION => 2

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_CLEANUP
     * @type {Integer (Int32)}
     */
    static CLEANUP => 3

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_COMPILATION
     * @type {Integer (Int32)}
     */
    static COMPILATION => 4

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_STATE_CREATION
     * @type {Integer (Int32)}
     */
    static STATE_CREATION => 5

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_STATE_SETTING
     * @type {Integer (Int32)}
     */
    static STATE_SETTING => 6

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_STATE_GETTING
     * @type {Integer (Int32)}
     */
    static STATE_GETTING => 7

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_RESOURCE_MANIPULATION
     * @type {Integer (Int32)}
     */
    static RESOURCE_MANIPULATION => 8

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_EXECUTION
     * @type {Integer (Int32)}
     */
    static EXECUTION => 9

    /**
     * Native name: D3D12_MESSAGE_CATEGORY_SHADER
     * @type {Integer (Int32)}
     */
    static SHADER => 10
}
