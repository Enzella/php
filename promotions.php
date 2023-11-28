<?php
include('connect.php');
include('includes/header.php');
include('includes/navbar.php');
?>

<div class="container">
    <h2>Promotion List</h2>
    <a href="add_promotion.php" class="btn btn-success mb-3">Add Promotion</a>
    <div class="table-responsive">
        <div class="scroll-table">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product ID</th>
                        <th>Content</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Created At</th>
                        <th>Updated At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT * FROM `promotions`";
                    $result = $conn->query($query);

                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . $row['id'] . "</td>";
                            echo "<td>" . $row['product_id'] . "</td>";
                            echo "<td>" . $row['content'] . "</td>";
                            echo "<td>" . $row['start_date'] . "</td>";
                            echo "<td>" . $row['end_date'] . "</td>";
                            echo "<td>" . $row['create_at'] . "</td>";
                            echo "<td>" . $row['update_at'] . "</td>";
                            echo "<td>";
                            echo "<div class='btn-group'>";
                            echo "<a href='edit_promotion.php?id=" . $row['id'] . "' class='btn btn-primary btn-sm'>Edit</a>";
                            echo "<a href='delete.php?table=promotions&id=" . $row['id'] . "' class='btn btn-danger btn-sm'>Delete</a>";
                            echo "</div>";
                            echo "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='8'>No promotions found</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<style>
    .scroll-table {
        overflow-x: auto;
    }
</style>

<?php
include('includes/scripts.php');
include('includes/footer.php');
?>