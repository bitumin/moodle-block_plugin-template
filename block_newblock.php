<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Form for editing newblock block instances.
 *
 * @package   block_newblock
 * @copyright 2016 Your Name <your@email.address>
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

/**
 * To customize the block you may want to override several methods from the parent block_base class
 * Class block_newblock
 */
class block_newblock extends block_base {
    public function init() {
        $this->title = get_string('pluginname', 'block_newblock');
    }

    /**
     * Return true if you want to enable admin settings page (see settings.php)
     * @return bool
     */
    public function has_config() {
        return true;
    }
}
